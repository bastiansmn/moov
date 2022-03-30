export enum RoleEnum {
   USER = "USER",
   MODERATOR = "MODERATOR",
   ADMIN = "ADMIN",
}

export interface Role {
   role_id: number,
   name: RoleEnum
}

export default interface User {
   user_uuid: string,
   email: string,
   username: string,
   roles: Array<RoleEnum>,
   birthyear: number,
   city_id: string,
   preferedRadius: number,
   userEmailNotifications: boolean,
   userRecommandations: boolean,
   accessToken: string
}