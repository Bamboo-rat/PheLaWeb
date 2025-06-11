import React, { useState, useEffect } from 'react';
import Header from '~/components/admin/Header';
import api from '~/config/axios';
import { Chart as ChartJS, CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend } from 'chart.js';
import { Line } from 'react-chartjs-2';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { useAuth } from '~/AuthContext';
import { FiChevronLeft, FiChevronRight, FiLock } from 'react-icons/fi';
import { useNavigate } from 'react-router-dom';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

interface DailyData {
  date: string;
  revenue: number;
  orderCount: number;
}

interface RevenueReport {
  totalRevenue: number;
  totalOrders: number;
  dailyData: DailyData[];
}

const Revenue = () => {
  const navigate = useNavigate();
  const { user, loading: authLoading } = useAuth();
  const [period, setPeriod] = useState('month');
  const [report, setReport] = useState<RevenueReport | null>(null);
  const [loading, setLoading] = useState(true);
  const [unauthorized, setUnauthorized] = useState(false);

  useEffect(() => {
    if (authLoading) return;

    const allowedRoles = ['SUPER_ADMIN', 'ADMIN'];
    if (!user || !allowedRoles.includes(user.role)) {
      setUnauthorized(true);
      toast.error('Bạn không có quyền truy cập trang này', {
        onClose: () => navigate('/admin/dashboard')
      });
      return;
    }

    fetchRevenue();
  }, [period, authLoading, navigate, user]);

  const fetchRevenue = async () => {
    setLoading(true);
    try {
      const response = await api.get(`/api/dashboard/revenue-report?period=${period}`);
      setReport(response.data);
    } catch (error: any) {
      console.error(`Failed to fetch ${period} revenue:`, error);
      toast.error('Không thể tải dữ liệu doanh thu. Vui lòng thử lại sau.', {
        className: 'bg-red-100 text-red-800'
      });
    } finally {
      setLoading(false);
    }
  };

  const formatRevenue = (value: number) => {
    if (value >= 1_000_000_000) {
        return `${(value / 1_000_000_000).toFixed(1)} tỷ`;
    }
    if (value >= 1_000_000) {
        return `${(value / 1_000_000).toFixed(1)} triệu`;
    }
    if (value >= 1_000) {
        return `${(value / 1_000).toFixed(0)} nghìn`;
    }
    return value.toLocaleString();
  };

  const formatPeriodLabel = (p: string) => {
    switch (p) {
      case 'day': return 'Hôm nay';
      case 'week': return 'Tuần này';
      case 'month': return 'Tháng này';
      case 'quarter': return 'Quý này';
      case 'year': return 'Năm nay';
      default: return p;
    }
  };

  // Xử lý khi không có dữ liệu
  const chartData = {
    labels: report?.dailyData?.map(d => {
      const date = new Date(d.date);
      return date.toLocaleDateString('vi-VN', { 
        day: '2-digit', 
        month: '2-digit',
        ...(period === 'year' && { year: 'numeric' })
      });
    }) || [],
    datasets: [
      {
        label: 'Doanh thu (VND)',
        data: report?.dailyData?.map(d => d.revenue) || [],
        borderColor: '#d4a373',
        backgroundColor: 'rgba(212, 163, 115, 0.1)',
        borderWidth: 2,
        tension: 0.1,
        fill: true,
        pointBackgroundColor: '#d4a373',
        pointBorderColor: '#fff',
        pointRadius: 4,
        pointHoverRadius: 6,
      },
    ],
  };

  const chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'top' as const,
        labels: {
          usePointStyle: true,
          padding: 20
        }
      },
      tooltip: {
        callbacks: {
          label: function (context: any) {
            let label = context.dataset.label || '';
            if (label) {
              label += ': ';
            }
            if (context.parsed.y !== null) {
              label += new Intl.NumberFormat('vi-VN', { 
                style: 'currency', 
                currency: 'VND' 
              }).format(context.parsed.y);
            }
            return label;
          },
          afterLabel: function (context: any) {
            const dataIndex = context.dataIndex;
            const orderCount = report?.dailyData?.[dataIndex]?.orderCount || 0;
            return `Đơn hàng: ${orderCount}`;
          }
        }
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(0, 0, 0, 0.05)'
        },
        ticks: {
           stepSize: 5000000,
           callback: function (value: any) {
               if (value >= 1000000) {
                 return `${(value / 1000000).toFixed(0)}tr`;
               }
               if (value >= 1000) {
                 return `${(value / 1000).toFixed(0)}k`;
               }
               return value;
           }
        }
      },
      x: {
        grid: {
          display: false
        },
        ticks: {
          maxTicksLimit: 10
        }
      }
    },
  };

  if (authLoading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-amber-600"></div>
      </div>
    );
  }

  if (unauthorized) {
    return (
      <div className="min-h-screen flex flex-col items-center justify-center bg-gray-50 p-4">
        <div className="max-w-md w-full bg-white rounded-lg shadow-md p-6 text-center">
          <div className="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-red-100 mb-4">
            <FiLock className="h-6 w-6 text-red-600" />
          </div>
          <h2 className="text-xl font-bold text-gray-800 mb-2">Truy cập bị từ chối</h2>
          <p className="text-gray-600 mb-6">
            Bạn không có quyền truy cập trang này. Vui lòng liên hệ quản trị viên nếu bạn cần quyền truy cập.
          </p>
          <button
            onClick={() => navigate('/admin/dashboard')}
            className="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-amber-600 hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500"
          >
            Quay lại trang Dashboard
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="relative min-h-screen bg-gray-50">
      <ToastContainer 
        position="top-right"
        autoClose={3000}
        toastClassName="border border-gray-200 shadow-lg"
        progressClassName="bg-amber-500"
        closeButton={false}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
      />
      <div className="fixed top-0 left-0 w-full bg-white shadow-md z-50">
        <Header />
      </div>
      
      <div className="container mx-auto px-4 py-20 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-800 mb-8">Báo cáo Doanh thu</h1>
        
        <div className="mb-8 flex flex-wrap gap-2">
          {['day', 'week', 'month', 'quarter', 'year'].map(p => (
            <button
              key={p}
              onClick={() => setPeriod(p)}
              disabled={loading}
              className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors disabled:opacity-50 ${
                period === p 
                ? 'bg-amber-600 text-white shadow-md' 
                : 'bg-white text-gray-700 hover:bg-gray-100 border border-gray-200'
              }`}
            >
              {formatPeriodLabel(p)}
            </button>
          ))}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
          <div className="bg-white rounded-xl shadow-md p-6 border-l-4 border-amber-500">
            <h3 className="text-sm font-medium text-gray-500">Tổng Doanh thu ({formatPeriodLabel(period)})</h3>
            <p className="text-2xl font-bold mt-1 text-gray-800">
              {report ? formatRevenue(report.totalRevenue) : '0'} VND
            </p>
            {report && (
              <p className="text-sm text-gray-500 mt-1">
                {new Intl.NumberFormat('vi-VN', { 
                  style: 'currency', 
                  currency: 'VND' 
                }).format(report.totalRevenue)}
              </p>
            )}
          </div>
          <div className="bg-white rounded-xl shadow-md p-6 border-l-4 border-gray-500">
            <h3 className="text-sm font-medium text-gray-500">Tổng Đơn hàng thành công ({formatPeriodLabel(period)})</h3>
            <p className="text-2xl font-bold mt-1 text-gray-800">
              {report?.totalOrders?.toLocaleString('vi-VN') || 0}
            </p>
            {report && report.totalOrders > 0 && (
              <p className="text-sm text-gray-500 mt-1">
                Trung bình: {new Intl.NumberFormat('vi-VN', { 
                  style: 'currency', 
                  currency: 'VND' 
                }).format(report.totalRevenue / report.totalOrders)}/đơn
              </p>
            )}
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-md p-6">
          <h2 className="text-xl font-semibold text-gray-800 mb-4">
            Biểu đồ doanh thu theo thời gian - {formatPeriodLabel(period)}
          </h2>
          
          {loading ? (
            <div className="flex justify-center items-center h-96">
              <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-amber-600"></div>
              <span className="ml-3 text-gray-600">Đang tải dữ liệu...</span>
            </div>
          ) : report && report.dailyData && report.dailyData.length > 0 ? (
            <div className="h-96">
              <Line data={chartData} options={chartOptions as any} />
            </div>
          ) : (
            <div className="flex justify-center items-center h-96 text-gray-500">
              <div className="text-center">
                <svg className="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
                </svg>
                <p className="mt-2">Không có dữ liệu để hiển thị</p>
                <p className="text-sm text-gray-400 mt-1">Thử chọn khoảng thời gian khác</p>
              </div>
            </div>
          )}
        </div>

        {/* Thêm bảng chi tiết dữ liệu */}
        {report && report.dailyData && report.dailyData.length > 0 && (
          <div className="mt-8 bg-white rounded-xl shadow-md p-6">
            <h2 className="text-xl font-semibold text-gray-800 mb-4">Chi tiết doanh thu</h2>
            <div className="overflow-x-auto">
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Ngày
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Doanh thu
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Số đơn hàng
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Doanh thu/Đơn
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {report.dailyData.map((data, index) => (
                    <tr key={index} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                      <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                        {new Date(data.date).toLocaleDateString('vi-VN')}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {new Intl.NumberFormat('vi-VN', { 
                          style: 'currency', 
                          currency: 'VND' 
                        }).format(data.revenue)}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {data.orderCount.toLocaleString('vi-VN')}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {data.orderCount > 0 ? new Intl.NumberFormat('vi-VN', { 
                          style: 'currency', 
                          currency: 'VND' 
                        }).format(data.revenue / data.orderCount) : '0 VND'}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default Revenue;