import { Counter } from "@/components/Counter";

export default async function Home() {
  const featureFlags = await fetch("http://localhost:3000/api/v1/feature_flags");
  const flags = await featureFlags.json();
  console.log({ flags });

  return (
    <Counter />
  );
}
