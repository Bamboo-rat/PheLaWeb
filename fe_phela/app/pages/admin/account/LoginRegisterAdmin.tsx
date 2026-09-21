import React, { useState } from "react";
import { motion } from "framer-motion";
import phela from "../../../assets/images/phela.jpg"; // Import ảnh
import Login from "./LoginAdmin";
import Register from "./RegisterAdmin";

const LoginRegister = () => {
    const [isRegister, setIsRegister] = useState(false);

    const toggleForm = () => {
        setIsRegister(!isRegister);
    };

    return (
        <div className="min-h-screen bg-gray-100 text-gray-900">
            <div className="flex min-h-screen flex-col md:flex-row">
                <motion.div
                    layout
                    key={isRegister ? "register" : "login"}
                    initial={{ opacity: 0, x: -24 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ duration: 0.35, ease: "easeOut" }}
                    className={`w-full bg-white md:w-1/2 ${isRegister ? "md:order-2" : "md:order-1"}`}
                >
                    {isRegister ? <Register /> : <Login />}
                </motion.div>

                <motion.div
                    layout
                    className={`relative hidden h-screen w-full items-end justify-center bg-cover bg-center md:flex md:w-1/2 ${isRegister ? "md:order-1" : "md:order-2"}`}
                    style={{
                        backgroundImage: `url(${phela})`,
                    }}
                    initial={{ opacity: 0.9 }}
                    animate={{ opacity: 1 }}
                    transition={{ layout: { duration: 0.5, ease: "easeInOut" }, opacity: { duration: 0.35 } }}
                >
                    <button
                        onClick={toggleForm}
                        className="mb-40 px-6 py-1.5 text-white text-2xl border hover:backdrop-brightness-75 hover:text-black rounded shadow-2xs shadow-neutral-200"
                    >
                        {isRegister ? "Login" : "Register"}
                    </button>
                </motion.div>
            </div>
        </div>
    );
};

export default LoginRegister;