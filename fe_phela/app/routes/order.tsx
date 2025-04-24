import type { Route } from "./+types/order";
import Order from "~/pages/customer/product/Order";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "Đặt hàng Phê La" },
    { name: "Đặt hàng", content: "Đặt hàng tại Phê La!" },
  ];
}

export default function HomePage() {
  return <Order />;
}
