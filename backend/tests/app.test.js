const { app, server, db } = require("../server")
const supertest = require("supertest")
const request = supertest(app)

describe('/hello endpoint', () => {
    it('should return a response', async () => {
        const response = await request.get("/api/hello")
        expect(response.status).toBe(200)
        expect(response.text).toBe("Hello");
    });
});

describe("test db connection", () => {
    it("should connect to db", async () => {
        await db.sequelize.authenticate()
    });
});

describe("test db migration", () => {
    it("should have inserted values", async () => {
        const response = await request.get("/api/tags/getTags")
        expect(response.status).toBe(200)
        expect(response.body).toEqual(db.TAGS)
    })
});


describe("Shutting down", () => {
    it("should close the server", () => {
        expect(server).toBeDefined();
        server?.close(err => {
            expect(err).toBe(undefined);
        })
    })
});
