export enum Roles {
   USER = "USER",
   MODERATOR = "MODERATOR",
   ADMIN = "ADMIN",
}

export default interface User {
   user_uuid: string,
   email: string,
   username: string,
   roles: Array<Roles>
}