import type { Route } from "./+types/officeBlock";
import OfficeBlock from "~/pages/customer/recruitment/OfficeBlock";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "Tuyển dụng - Khối văn phòng" },
    { name: "Tuyển dụng", content: "Phê La tuyển dụng!" },
  ];
}

export default function HomePage() {
  return <OfficeBlock />;
}
