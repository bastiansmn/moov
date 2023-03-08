module.exports = (app) => {
    app.use((_req, res, next) => {
        res.header(
            "Access-Control-Allow-Headers",
            "x-access-token, Origin, Content-Type, Accept"
        );
        next();
    });
    // Route to test if server is up and running
    app.get("/api/hello", (_req, res) => {
        res.status(200).send("Hello");
    })
}
