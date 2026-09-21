import React, { useEffect, useState } from 'react';
import { useSearchParams, Link, useNavigate } from 'react-router-dom';
import '~/assets/css/DeliveryAddress.css'

const PaymentReturn = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const [message, setMessage] = useState('');
    const [isSuccess, setIsSuccess] = useState(false);
    const [countdown, setCountdown] = useState(3);
    const orderId = searchParams.get('orderId') || searchParams.get('orderCode');

    useEffect(() => {
        const status = (searchParams.get('status') || '').toLowerCase();
        const code = searchParams.get('code');
        const cancel = (searchParams.get('cancel') || '').toLowerCase();

        const successfulStatuses = ['success', 'succeeded', 'paid'];
        const isPaymentSuccess =
            successfulStatuses.includes(status) ||
            code === '00' ||
            cancel === 'false';

        if (isPaymentSuccess) {
            setMessage('Thanh toán thành công!');
            setIsSuccess(true);
        } else {
            setMessage('Thanh toán thất bại. Vui lòng thử lại hoặc liên hệ hỗ trợ.');
            setIsSuccess(false);
        }
    }, [searchParams]);

    // Tự động điều hướng về lịch sử đơn hàng sau 3 giây nếu thành công
    useEffect(() => {
        if (!isSuccess) return;

        const timer = setInterval(() => {
            setCountdown((prev) => {
                if (prev <= 1) {
                    clearInterval(timer);
                    navigate('/my-orders');
                    return 0;
                }
                return prev - 1;
            });
        }, 1000);

        return () => clearInterval(timer);
    }, [isSuccess, navigate]);

    return (
        <div className="flex items-center justify-center min-h-screen bg-gray-100">
            <div className="bg-white p-10 rounded-lg shadow-lg text-center max-w-md w-full">
                {isSuccess ? (
                    <svg className="mx-auto h-16 w-16 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                ) : (
                    <svg className="mx-auto h-16 w-16 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                         <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z" />
                    </svg>
                )}
                <h1 className={`mt-4 text-2xl font-bold ${isSuccess ? 'text-gray-800' : 'text-red-600'}`}>
                    {message}
                </h1>
                <p className="mt-2 text-gray-600">Cảm ơn bạn đã mua hàng.</p>

                {isSuccess && (
                    <p className="mt-2 text-sm text-gray-400">
                        Chuyển về lịch sử đơn hàng sau {countdown} giây...
                    </p>
                )}

                <div className="mt-6 flex flex-col gap-3">
                    {/* Nút xem lịch sử đơn hàng - luôn hiện */}
                    <Link
                        to="/my-orders"
                        className="block w-full px-6 py-3 bg-primary text-white font-semibold rounded-lg hover:bg-primary-dark transition-colors"
                    >
                        Xem lịch sử đơn hàng
                    </Link>

                    {/* Nút xem chi tiết đơn hàng cụ thể - chỉ hiện nếu có orderId */}
                    {orderId && (
                        <Link
                            to={`/my-orders/${orderId}`}
                            className="block w-full px-6 py-3 bg-gray-100 text-gray-700 font-semibold rounded-lg hover:bg-gray-200 transition-colors"
                        >
                            Xem chi tiết đơn hàng này
                        </Link>
                    )}

                    {/* Nút về trang chủ nếu thất bại */}
                    {!isSuccess && (
                        <Link
                            to="/"
                            className="block w-full px-6 py-3 bg-gray-100 text-gray-700 font-semibold rounded-lg hover:bg-gray-200 transition-colors"
                        >
                            Về trang chủ
                        </Link>
                    )}
                </div>
            </div>
        </div>
    );
};

export default PaymentReturn;