import type { Route } from "./+types/blockOfShops";
import BlockOfShops from "~/pages/customer/recruitment/BlockOfShops";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "Tuyển dụng - Khối cửa hàng" },
    { name: "Tuyển dụng", content: "Phê La tuyển dụng!" },
  ];
}

export default function HomePage() {
  return <BlockOfShops />;
}
