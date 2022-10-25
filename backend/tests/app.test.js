const { app, server, db } = require("../server")
const supertest = require("supertest")
const request = supertest(app)
const { ConnectionRefusedError } = require("sequelize")

describe('/hello endpoint', () => {
    it('should return a response', async () => {
        const response = await request.get("/hello")
        expect(response.status).toBe(200)
        expect(response.text).toBe("Hello");
    });
});

describe("test db", () => {
    it("should connect to db", async () => {
        expect(async () => {
            await db.sequelize.authenticate()
        }).not.toThrow(ConnectionRefusedError);
    });
})


describe("Shutting down", () => {
    it("should close the server", () => {
        expect(server).toBeDefined();
        server?.close(err => {
            expect(err).toBe(undefined);
        })
    })
})
