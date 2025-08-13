import { Counter } from "@/components/Counter";
import { FeatureFlag } from "@/types/FeatureFlag";

export default async function Home() {
  const featureFlags = await fetch("http://localhost:3000/api/v1/feature_flags");
  const flags: FeatureFlag[] = await featureFlags.json();

  return flags[0].value ? <Counter /> : null;
}
