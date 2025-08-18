lab 6 question:Create a component that updates the document title every time the count is incremented. 
Use useEffect() to update the title whenever the count state changes.

import React, { useState, useEffect } from 'react';

const TitleUpdater = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    document.title = Count: ${count};
  }, [count]);  // Effect runs only when count changes

  return (
    <div>
      <h1>Count: {count}</h1>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
};

export default TitleUpdater;

// App.js
import { useEffect, useState } from "react";

export default function App() {
  const [properties, setProperties] = useState([]);

  // Fetch properties from backend
  useEffect(() => {
    fetch("http://localhost:5000/fetch")
      .then((res) => res.json())
      .then((data) => setProperties(data));
  }, []);

  // Modify property (example: update price)
  const updatePrice = async (id, newPrice) => {
    const res = await fetch(http://localhost:5000/properties/${id}, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ price: newPrice })
    });
    const updated = await res.json();
    setProperties((prev) =>
      prev.map((p) => (p.id === id ? updated : p))
    );
  };

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Mumbai & Pune Properties (₹50L–₹1Cr)</h1>
      <div className="grid grid-cols-3 gap-4">
        {properties.map((p) => (
          <div key={p.id} className="border p-4 rounded-xl shadow">
            <h2 className="font-semibold">{p.title}</h2>
            <p>{p.locality}</p>
            <p>Price: ₹{p.price}</p>
            <p>{p.bedrooms} BHK | {p.carpetArea} sqft</p>
            <a href={p.url} target="_blank" rel="noreferrer" className="text-blue-500">
              View Listing
            </a>

            {/* Modify button (example: change price) */}
            <button
              className="mt-2 bg-blue-500 text-white px-3 py-1 rounded"
              onClick={() => updatePrice(p.id, p.price + 100000)} // add +1L
            >
              Increase Price +1L
            </button>
          </div>
        ))}
      </div>
    </div>
  );
}
