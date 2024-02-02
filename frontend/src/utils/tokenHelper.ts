import axios from "axios";
import { AxiosRequestConfig, AxiosError } from 'axios';

const axiosApiInstance = axios.create({
    baseURL: "http://localhost:8080/api",
});



axiosApiInstance.interceptors.request.use(
    async (config ) => {
        const accessToken = localStorage.getItem("accessToken");

        config.headers = config.headers || {};

        if (accessToken) {
            config.headers['Authorization'] = `Bearer ${accessToken}`;
        } else {
            delete config.headers['Authorization'];
        }

        return config;
    },
    (error: AxiosError) => {
        return Promise.reject(error);
    }
);


export default axiosApiInstance;
