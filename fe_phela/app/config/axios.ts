import axios from 'axios';
import type { AxiosInstance } from 'axios';

// Tạo một instance của Axios
const api: AxiosInstance = axios.create({
  baseURL: 'http://localhost:8080', // Địa chỉ API của bạn
  timeout: 10000, // Thời gian chờ tối đa
  headers: {
    'Content-Type': 'application/json',
  },
});

// Thêm interceptor để xử lý lỗi (tuỳ chọn)
api.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error('API Error:', error);
    return Promise.reject(error);
  }
);

export default api;