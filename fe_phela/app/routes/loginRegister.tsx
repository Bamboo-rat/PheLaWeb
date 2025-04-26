import type { Route } from "./+types/loginRegister";
import LoginRegister from "~/pages/customer/account/LoginRegister";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "Đăng nhập tài khoản" },
    { name: "Đăng nhập", content: "Kết nối Phê La nào!" },
  ];
}

export default function HomePage() {
  return <LoginRegister />;
}
