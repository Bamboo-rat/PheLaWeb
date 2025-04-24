import React from "react";
import { FaFacebookF } from "react-icons/fa";
import { FaGoogle } from "react-icons/fa";

const Login = () => {
    return (
        <div className="flex flex-col justify-center items-center p-10 bg-white h-screen">
            <h2 className="text-3xl font-bold mb-6">Login</h2>
            <input
                type="text"
                placeholder="Name"
                className="p-2 mb-4 w-80 rounded border"
            />
            <input
                type="password"
                placeholder="Password"
                className="p-2 mb-4 w-80 rounded border"
            />
            <div className="flex justify-between w-80 mb-4">
                <label className="flex items-center">
                    <input type="checkbox" className="mr-2" /> Remember me
                </label>
                <a href="#" className="text-sm text-gray-500">
                    Forgot password?
                </a>
            </div>
            <button className="w-64 p-2 bg-yellow-50 text-black rounded hover:bg-yellow-100 transition delay-150 duration-300 ease-in-out hover:-translate-y-1 hover:scale-110 drop-shadow-lg">
                Login
            </button>
            <p className="mt-4">or use your account</p>
            <div className="flex gap-4 mt-2">
            <FaFacebookF />
            <FaGoogle />
            </div>
        </div>
    );
};

export default Login;