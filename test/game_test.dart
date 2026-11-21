import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_kart_remi/oyun_kart_remi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(remiConfig.title.length, 33);
    expect(remiConfig.tagline.length, 33);
    for (final s in remiConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve oyun sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: remiId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = remiRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TableGameRules.simulate(gl.puzzle);
      expect(end.over, isTrue, reason: 'bölüm $lv');
    }
  });
}
