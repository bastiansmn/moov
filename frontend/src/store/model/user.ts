export enum Roles {
   USER,
   ADMIN
}

export default interface User {
   user_uuid: string,
   email: string,
   username: string,
   roles: Array<Roles>
}