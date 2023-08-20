import { requireNativeViewManager } from 'expo-modules-core';
import * as React from 'react';

import { ExpoArViewProps } from './ExpoAr.types';

const NativeView: React.ComponentType<ExpoArViewProps> =
  requireNativeViewManager('ExpoAr');

export default function ExpoArView(props: ExpoArViewProps) {
  return <NativeView {...props} />;
}
