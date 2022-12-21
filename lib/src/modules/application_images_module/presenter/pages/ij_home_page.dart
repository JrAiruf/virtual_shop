import 'package:flutter/material.dart';

class IJHome extends StatelessWidget {
  const IJHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _buildBodyBack(),
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Colors.amber,
                  elevation: 0,
                  floating: true,
                  snap: true,
                  flexibleSpace: FlexibleSpaceBar(),
                ),
                FutureBuilder(
                    future: Future.delayed(const Duration(hours: 2)),
                    builder: (appContext, images) {
                      return SliverToBoxAdapter(
                        child: Container(
                          child: _buildBodyBack(),
                        ),
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyBack() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.amber,
          ],
        ),
      ),
    );
  }
}
