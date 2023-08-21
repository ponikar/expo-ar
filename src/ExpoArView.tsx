import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";

import { ExpoArViewProps } from "./ExpoAr.types";
import { ViewProps } from "react-native";

const NativeView: React.ComponentType<ExpoArViewProps & ViewProps> =
  requireNativeViewManager("ExpoAr");

export default function ExpoArView(props: ExpoArViewProps) {
  return <NativeView {...props} />;
}
