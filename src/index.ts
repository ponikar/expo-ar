import { NativeModulesProxy, EventEmitter, Subscription } from 'expo-modules-core';

// Import the native module. On web, it will be resolved to ExpoAr.web.ts
// and on native platforms to ExpoAr.ts
import ExpoArModule from './ExpoArModule';
import ExpoArView from './ExpoArView';
import { ChangeEventPayload, ExpoArViewProps } from './ExpoAr.types';

// Get the native constant value.
export const PI = ExpoArModule.PI;

export function hello(): string {
  return ExpoArModule.hello();
}

export async function setValueAsync(value: string) {
  return await ExpoArModule.setValueAsync(value);
}

const emitter = new EventEmitter(ExpoArModule ?? NativeModulesProxy.ExpoAr);

export function addChangeListener(listener: (event: ChangeEventPayload) => void): Subscription {
  return emitter.addListener<ChangeEventPayload>('onChange', listener);
}

export { ExpoArView, ExpoArViewProps, ChangeEventPayload };
