import React from 'react'
import Header from '~/components/admin/Header'

const HomeAdmin = () => {
  return (
    <div>
      <Header />
      <div className="flex flex-col justify-center items-center p-10 bg-yellow-50 text-black h-screen">
        <h2 className="text-3xl font-bold mb-6">Trang quản trị</h2>
        <p className="text-xl">Chào mừng bạn đến với trang quản trị!</p>
        <p className="text-lg">Tại đây bạn có thể quản lý tất cả các chức năng của hệ thống.</p>
      </div>
    </div>
  )
}

export default HomeAdmin
