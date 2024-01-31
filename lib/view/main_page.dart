import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_dog/provider/api_provider.dart';
import 'package:random_dog/provider/cart_provider.dart';
import 'package:random_dog/provider/history_provider.dart';

class MainViewPage extends ConsumerWidget {
  const MainViewPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(getpostProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Dogs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: api.isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : api.when(
              data: (data) {
                if (data == null) {
                  return const Center(
                    child: CircleAvatar(),
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: 300,
                        height: 250,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(216, 0, 0, 0),
                                blurRadius: 15,
                                blurStyle: BlurStyle.solid,
                                spreadRadius: 1.5)
                          ],
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Image.network(
                          data.message.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 50),
                              ),
                            ),
                          ),
                          onPressed: () {
                            ref.read(refreshProvider);
                            ref
                                .read(historyNotifierProvider.notifier)
                                .addToHistory(data);
                          },
                          child: const Text(
                            'press the button',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 50),
                              ),
                            ),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addToCart(data);
                          },
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const ContinuousRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(10, 50),
                              ),
                            ),
                          ),
                          onPressed: null,
                          child: Text(
                            data.price != null
                                ? '\$${data.price}'
                                : 'Price not available',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              error: (error, stackTrace) => const Center(
                child: Text('error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
