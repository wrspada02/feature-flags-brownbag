'use client'
import { useState } from "react";

export function Counter() {
  const [counter, setCounter] = useState<number>(0);

  return (
    <section className="bg-[#FAFAFA] p-5 rounded-lg shadow-md text-black">
      <h1 className="font-bold">Feature Flag - Counter</h1>
      <p>This feature flag controls the visibility of the counter component.</p>
      <button onClick={() => setCounter(counter + 1)} className="bg-blue-500 text-white p-2 rounded cursor-pointer">
        Current Value: <span className="font-bold">{counter}</span>
      </button>
    </section>
  )
}
