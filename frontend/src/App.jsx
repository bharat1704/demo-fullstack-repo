import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/vite.svg";

function App() {
  const [count, setCount] = useState(0);
  const [message, setMessage] = useState(""); // for backend response
  const [loading, setLoading] = useState(false);

  // Function to call backend API
  const fetchMessage = async () => {
    setLoading(true);
    try {
      const res = await fetch("http://bharatmali.store/api/hello");
      const data = await res.json();
      setMessage(data.message);
    } catch (err) {
      console.error(err);
      setMessage("Unable to Fetch data from Server");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>

      <h1>Vite + React</h1>

      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>

        {/* 👇 New button to call API */}
        <button
          onClick={fetchMessage}
          style={{
            marginLeft: "10px",
            padding: "8px 16px",
            borderRadius: "6px",
            backgroundColor: "#007bff",
            color: "white",
            border: "none",
            cursor: "pointer",
          }}
        >
          Call API
        </button>

        <p>{loading ? "Loading..." : message}</p>

        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>

      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
    </div>
  );
}

export default App;
