import React, { useState, useEffect } from 'react';
import Header from '~/components/customer/Header'
import Footer from '~/components/customer/Footer'
import imgStore from "~/assets/images/store.png"
import { getPublicBranches } from '~/services/branchService';

interface Branch {
  branchCode: string;
  branchName: string;
  latitude: number;
  longitude: number;
  city: string;
  district: string;
  address: string;
  status: string;
}

const Store = () => {
  const [branches, setBranches] = useState<Branch[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedBranch, setSelectedBranch] = useState<Branch | null>(null);

  useEffect(() => {
    const fetchBranches = async () => {
      try {
        const branchesData = await getPublicBranches();
        setBranches(branchesData);
        setLoading(false);
      } catch (error) {
        console.error('Error fetching branches:', error);
        setLoading(false);
      }
    };
    fetchBranches();
  }, []);

  const groupedByCity = branches.reduce<Record<string, Record<string, Branch[]>>>((acc, branch) => {
    const { city, district } = branch;
    if (!acc[city]) {
      acc[city] = {};
    }
    if (!acc[city][district]) {
      acc[city][district] = [];
    }
    acc[city][district].push(branch);
    return acc;
  }, {});

  const handleBranchClick = (branch: Branch) => {
    setSelectedBranch(branch);
  };

  const closeMap = () => {
    setSelectedBranch(null);
  };

  const mapUrl = selectedBranch 
    ? `https://www.openstreetmap.org/export/embed.html?bbox=${selectedBranch.longitude-0.01},${selectedBranch.latitude-0.01},${selectedBranch.longitude+0.01},${selectedBranch.latitude+0.01}&layer=mapnik&marker=${selectedBranch.latitude},${selectedBranch.longitude}`
    : '';

  return (
    <div className="relative">
      {/* Map Overlay */}
      {selectedBranch && (
        <div
          className="fixed inset-0 z-[60] flex items-center justify-center bg-black/50 p-4 backdrop-blur-[2px]"
          onClick={closeMap}
        >
          <div
            className="max-h-[85vh] w-full max-w-4xl overflow-y-auto rounded-lg bg-white shadow-xl"
            onClick={(e) => e.stopPropagation()}
          >
            <div className="flex justify-between items-center p-4 border-b">
              <h3 className="text-xl font-bold">{selectedBranch.branchName}</h3>
              <button
                onClick={closeMap}
                className="text-gray-500 hover:text-gray-700 text-2xl"
              >
                ×
              </button>
            </div>
            <div className="p-4">
              <p className="mb-4">{selectedBranch.address}</p>
              <iframe
                src={mapUrl}
                width="100%"
                height="400px"
                style={{ border: 0 }}
                loading="lazy"
                title={`Bản đồ ${selectedBranch.branchName}`}
              />
              <div className="mt-4 flex gap-3">
                <a
                  href={`https://www.google.com/maps/dir/?api=1&destination=${selectedBranch.latitude},${selectedBranch.longitude}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition-colors"
                >
                  Chỉ đường bằng Google Maps
                </a>
                <a
                  href={`https://www.openstreetmap.org/?mlat=${selectedBranch.latitude}&mlon=${selectedBranch.longitude}#map=16/${selectedBranch.latitude}/${selectedBranch.longitude}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition-colors"
                >
                  Chỉ đường bằng OpenStreetMap
                </a>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Main Content */}
      <div>
        <div className="fixed top-0 left-0 w-full bg-white shadow-md z-50">
          <Header />
        </div>
        
        {/* Banner */}
        <div className="relative w-full h-72 mt-14">
          <img
            src={imgStore}
            alt="Phong cách khác biệt"
            className="w-full h-72 object-cover brightness-75"
          />
          <div className="absolute inset-0 flex items-center justify-center">
            <h1 className="text-4xl font-bold uppercase text-white text-center drop-shadow-lg">
              HỆ THỐNG CỬA HÀNG
            </h1>
          </div>
        </div>

        {/* Main Content */}
        <main className="container mx-auto px-4 py-8">
          <h1 className="text-2xl font-bold mb-6 text-center">Hệ thống cửa hàng</h1>
          {loading ? (
            <p className="text-center">Đang tải...</p>
          ) : (
            <div className="item_store_li">
              {Object.entries(groupedByCity).map(([city, districts]) => (
                <div key={city} className="mb-10 gap-6">
                  <h2 className="text-2xl font-bold text-center mb-6">{city}</h2>
                  <div className='grid grid-cols-1 md:grid-cols-2 gap-6'>
                    {Object.entries(districts).map(([district, branches]) => (
                      <div key={district} className="mb-6">
                        <h3 className="text-xl font-semibold text-brown-700 mb-3">{district}</h3>
                        <div>
                          {branches.map((branch) => (
                            <div key={branch.branchCode} className="flex items-start mb-3">
                              <span className="text-brown-600 mr-2">📍</span>
                              <div>
                                <button
                                  onClick={() => handleBranchClick(branch)}
                                  className="text-brown-800 font-semibold hover:text-brown-600 hover:underline cursor-pointer bg-transparent border-none p-0 text-left mb-1"
                                >
                                  {branch.branchName}
                                </button>
                                <p className="text-brown-800">{branch.address}</p>
                                <p className="text-brown-600 text-sm">Số điện thoại: 1900 3013</p>
                              </div>
                            </div>
                          ))}
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
        </main>
        <Footer />
      </div>
    </div>
  );
};

export default Store;