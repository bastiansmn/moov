import {v4 as uuid} from 'uuid';
import Event from './event';

interface UserSimplified {
   user_uuid: typeof uuid,
   username: string,
   email: string,
}

export interface ThemeState {
   status_id: number,
   name: string,
}

export default interface Theme {
   theme_id: number,
   name: string,
   description: string,
   themed_events: Array<Event>,
   theme_state: ThemeState,
   user: UserSimplified,
}
