import type { Route } from "./+types/endow";
import Endow from "~/pages/customer/news/Endow";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "Tin tức - Ưu đãi" },
    { name: "Ưu đãi", content: "Ưu đãi tại Phê La!" },
  ];
}

export default function HomePage() {
  return <Endow />;
}
