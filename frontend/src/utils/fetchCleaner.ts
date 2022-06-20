export default function clean(endpoint: string) {
    if (!import.meta.env.PROD) return endpoint;
    if (endpoint.match("/api"))
        return endpoint.replace("/api", import.meta.env.VITE_BACKEND_URL ?? "http://localhost:3000");
    return endpoint;
}
