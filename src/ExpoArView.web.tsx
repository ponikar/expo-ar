import * as React from 'react';

import { ExpoArViewProps } from './ExpoAr.types';

export default function ExpoArView(props: ExpoArViewProps) {
  return (
    <div>
      <span>{props.name}</span>
    </div>
  );
}
