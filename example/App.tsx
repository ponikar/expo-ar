import { StyleSheet, Text, View } from "react-native";

import { ExpoArView } from "expo-ar";

import { Dimensions } from "react-native";

const d = Dimensions.get("screen");

export default function App() {
  return (
    <View style={styles.container}>
      <ExpoArView name="DARSHAN" style={{ width: d.width, height: d.height }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
});
