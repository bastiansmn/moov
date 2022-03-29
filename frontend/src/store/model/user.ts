export enum Roles {
   USER = "USER",
   MODERATOR = "MODERATOR",
   ADMIN = "ADMIN",
}

export default interface User {
   user_uuid: string,
   email: string,
   username: string,
   roles: Array<Roles>,
   birthyear: number,
   city_id: string,
   preferedRadius: number,
   userEmailNotifications: boolean,
   userRecommandations: boolean,
   accessToken: string
}