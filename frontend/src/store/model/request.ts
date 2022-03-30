import {v4 as uuid} from 'uuid';

export default interface Request {
   request_id: number,
   jwt_used: string,
   user_agent: string,
   hostname: string,
   date: Date,
   endpoint: string,
   user_uuid: typeof uuid
}