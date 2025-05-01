import { route } from "@react-router/dev/routes";
import React, { useState } from "react";
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { registerAdmin } from '~/services/authServices';

const RegisterAdmin = () => {
    const [formData, setFormData] = useState({
        fullname: '',
        username: '',
        password: '',
        dob: '',
        email: '',
        phone: '',
        gender: '',
    });
    const [error, setError] = useState('');

    // Hàm chuyển đổi định dạng ngày từ YYYY-MM-DD sang dd/MM/yyyy
    const formatDateToDDMMYYYY = (dateStr: string) => {
        if (!dateStr) return '';
        const date = new Date(dateStr);
        const day = String(date.getDate()).padStart(2, '0');
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const year = date.getFullYear();
        return `${day}/${month}/${year}`;
    };

    // Hàm kiểm tra mật khẩu
    const validatePassword = (password: string) => {
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,128}$/;
        return passwordRegex.test(password);
    };

    const handleRegister = async () => {
        try {
            // Kiểm tra dữ liệu trước khi gửi
            if (!formData.fullname || !formData.username || !formData.password || !formData.dob || !formData.email || !formData.phone || !formData.gender) {
                setError('Không được để trống bất kỳ trường nào!');
                return;
            }

            if (!validatePassword(formData.password)) {
                setError('Mật khẩu phải chứa ít nhất 8 ký tự, bao gồm chữ thường, chữ hoa, số và ký tự đặc biệt.');
                return;
            }

            const formattedData = {
                ...formData,
                dob: formData.dob ? formatDateToDDMMYYYY(formData.dob) : '',
                // Không chuẩn hóa gender, gửi trực tiếp "Nam", "Nữ", "Khác"
            };

            await registerAdmin(formattedData);
            console.log('Admin đăng ký thành công');
            alert('Đăng ký thành công!');
            // Xoá dữ liệu sau khi đăng ký thành công
            setFormData({
                fullname: '',
                username: '',
                password: '',
                dob: '',
                email: '',
                phone: '',
                gender: 
                '',
            });
            setError('');
            // Chuyển hướng sau khi đăng ký thành công
            route("login-register-admin", "routes/loginRegisterAdmin.tsx");
        } catch (err: any) {
            // Hiển thị lỗi chi tiết từ backend nếu có
            setError(err.response?.data?.message || 'Admin registration failed.');
        }
    };

    return (
        <div className="flex flex-col justify-center items-center p-10 bg-yellow-50 text-black h-screen overflow-y-auto">
            <h2 className="text-3xl font-bold mb-6">Admin Register</h2>

            <input
                type="text"
                value={formData.fullname}
                onChange={(e) => setFormData({ ...formData, fullname: e.target.value })}
                placeholder="Fullname"
                className="p-2 mb-4 w-80 rounded border"
            />

            <input
                type="text"
                value={formData.username}
                onChange={(e) => setFormData({ ...formData, username: e.target.value })}
                placeholder="Username"
                className="p-2 mb-4 w-80 rounded border"
            />

            <input
                type="password"
                value={formData.password}
                onChange={(e) => setFormData({ ...formData, password: e.target.value })}
                placeholder="Password"
                className="p-2 mb-4 w-80 rounded border"
            />

            <input
                type="email"
                value={formData.email}
                onChange={(e) => setFormData({ ...formData, email: e.target.value })}
                placeholder="Email"
                className="p-2 mb-4 w-80 rounded border"
            />          

            <input
                type="date"
                value={formData.dob}
                onChange={(e) => setFormData({ ...formData, dob: e.target.value })}
                placeholder="Date of Birth"
                className="p-2 mb-4 w-80 rounded border"
            />

            <input
                type="text"
                value={formData.phone}
                onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
                placeholder="Phone (10-11 digits)"
                className="p-2 mb-4 w-80 rounded border"
            />

            <select 
                className="p-2 mb-4 w-80 rounded border" 
                value={formData.gender} 
                onChange={(e) => setFormData({ ...formData, gender: e.target.value })}
            >
                <option value="">Chọn giới tính</option>
                <option value="Nam">Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
            </select>

            <button 
                onClick={handleRegister} 
                className="w-64 p-2 bg-black text-white rounded transition delay-150 duration-300 ease-in-out hover:-translate-y-1 hover:scale-110 drop-shadow-lg"
            >
                Register
            </button>
            {error && <p className="text-red-500 mt-4">{error}</p>}
        </div>
    );
};

export default RegisterAdmin;