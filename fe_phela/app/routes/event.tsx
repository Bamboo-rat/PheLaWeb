import type { Route } from "./+types/endow";
import Event from "~/pages/customer/news/Event";
export function meta({}: Route.MetaArgs) {
  return [
    { title: "Tin tức - Sự kiện" },
    { name: "Sự kiện", content: "Sự kiện tại Phê La!" },
  ];
}

export default function HomePage() {
  return <Event />;
}
