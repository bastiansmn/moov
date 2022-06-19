export default function clean(endpoint: string) {
    if (endpoint.match("/api") && import.meta.env.PROD)
        return endpoint.replace("/api", "");
    return endpoint;
}