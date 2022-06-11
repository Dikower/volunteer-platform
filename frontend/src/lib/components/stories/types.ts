export interface Author {
  name: string;
  img: string;
}

export interface StoryType {
  title: string;
  watched: boolean;
  opened: boolean;
  author: Author;
  when: string;
  screens: string[];
  nav: number
  duration: number
}