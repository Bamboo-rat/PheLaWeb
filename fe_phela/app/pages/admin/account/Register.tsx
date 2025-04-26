import React from "react";

const Register = () => {
    return (
        <div className="flex flex-col justify-center items-center p-10 bg-yellow-50 text-black h-screen">
            <h2 className="text-3xl font-bold mb-6">Register</h2>
            <input
                type="text"
                placeholder="Username"
                className="p-2 mb-4 w-80 rounded border"
            />
            <input
                type="email"
                placeholder="Email"
                className="p-2 mb-4 w-80 rounded border"
            />
            <input
                type="password"
                placeholder="Password"
                className="p-2 mb-4 w-80 rounded border"
            />
            <select className="p-2 mb-4 w-80 rounded border">
                <option value="">Chọn giới tính</option>
                <option value="male">Nam</option>
                <option value="female">Nữ</option>
                <option value="other">Khác</option>
            </select>
            <button className="w-64 p-2 bg-black text-white rounded transition delay-150 duration-300 ease-in-out hover:-translate-y-1 hover:scale-110 drop-shadow-lg">
                Register
            </button>
        </div>
    );
};

export default Register;