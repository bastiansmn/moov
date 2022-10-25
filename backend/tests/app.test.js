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

describe("test db connection", () => {
    it("should connect to db", async () => {
        await db.sequelize.sync()
    });
})

describe("test db migration", () => {
    it("should have inserted values", async () => {
        const response = await request.get("/tags/getTags")
        expect(response.status).toBe(200)
        expect(response.body).toEqual(db.TAGS)
    })
})


describe("Shutting down", () => {
    it("should close the server", () => {
        expect(server).toBeDefined();
        server?.close(err => {
            expect(err).toBe(undefined);
        })
    })
})
