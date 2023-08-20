import { StyleSheet, Text, View } from 'react-native';

import * as ExpoAr from 'expo-ar';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>{ExpoAr.hello()}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
