import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:video_player_poc/constants/html_blocks.dart';

class HTMLViewBlock extends StatelessWidget {
  BlockType? blockType;
  HTMLViewBlock({this.blockType, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTML View Block')),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...htmlBlockRenderWidget(blockType!),
          ],
        ),
      ),
    );
  }

  List<Widget> htmlBlockRenderWidget(BlockType blockType) {
    switch (blockType) {
      case BlockType.video:
        return [
          Image.asset(
            'assets/custom_video_block_data.png',
            // width: kIsWeb ? 300 : null,
          ),
          const SizedBox(height: 20),
          const Text(
              'A direct video url will be fetched using the object id, and will be passed to video player')
        ];
      case BlockType.html:
        return [
          Image.asset(
            'assets/custom_html_block_data.png',
            // width: kIsWeb ? 300 : null,
          ),
          const SizedBox(height: 20),
          Html.fromDom(document: htmlparser.parse(HTMLBlocks.customHTMLBlock)),
        ];
      case BlockType.problem:
        return [
          Image.asset(
            'assets/custom_problem_block_data.png',
            // width: kIsWeb ? 300 : null,
          ),
          const SizedBox(height: 20),
          const Text(
              'Have added HTML Render block below, but because of custom react components, the data cannot be parsed'),
          Html.fromDom(document: htmlparser.parse(HTMLBlocks.problemBlock)),
        ];
    }
  }
}

enum BlockType { video, html, problem }
