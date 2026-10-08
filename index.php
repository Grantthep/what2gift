<?php
require __DIR__ . '/db.php';

const INTERESTS = [
    'tech' => ['Tech & Gadgets', '💻'], 'gaming' => ['Gaming', '🎮'], 'reading' => ['Reading & Writing', '📚'],
    'music' => ['Music', '🎵'], 'art' => ['Art & Crafts', '🎨'], 'cooking' => ['Cooking & Food', '🍳'],
    'coffee' => ['Coffee & Tea', '☕'], 'fitness' => ['Fitness', '💪'], 'sports' => ['Sports', '⚽'],
    'outdoors' => ['Outdoors', '🏕️'], 'travel' => ['Travel', '✈️'], 'fashion' => ['Fashion', '👗'],
    'beauty' => ['Beauty & Grooming', '💄'], 'wellness' => ['Wellness', '🧘'], 'home' => ['Home & Decor', '🏠'],
    'gardening' => ['Gardening', '🌱'], 'photography' => ['Photography', '📷'], 'movies' => ['Movies & TV', '🎬'],
    'pets' => ['Pets', '🐾'], 'science' => ['Science & Learning', '🔬'], 'diy' => ['DIY & Making', '🛠️'],
    'toys' => ['Toys & Play', '🧸'],
];
const OCCASIONS = [
    'birthday' => 'Birthday', 'christmas' => 'Christmas & Holidays', 'anniversary' => 'Anniversary',
    'valentines' => "Valentine's Day", 'wedding' => 'Wedding', 'graduation' => 'Graduation',
    'housewarming' => 'Housewarming', 'mothers_day' => "Mother's Day", 'fathers_day' => "Father's Day",
    'retirement' => 'Retirement', 'thank_you' => 'Thank You', 'baby' => 'New Baby',
];
const BUDGETS = [0 => 'Any budget', 25 => 'Under $25', 50 => 'Under $50', 100 => 'Under $100', 250 => 'Under $250'];

function e($s): string { return htmlspecialchars((string)$s, ENT_QUOTES); }

// --- Read & validate input (GET so results are shareable links) ---
$searched = isset($_GET['age']);
$age = filter_input(INPUT_GET, 'age', FILTER_VALIDATE_INT, ['options' => ['min_range' => 0, 'max_range' => 120]]);
$age = is_int($age) ? $age : null;
$occasion = is_string($_GET['occasion'] ?? null) && isset(OCCASIONS[$_GET['occasion']]) ? $_GET['occasion'] : '';
$budget = (int)($_GET['budget'] ?? 0);
$budget = isset(BUDGETS[$budget]) ? $budget : 0;
$picked = array_values(array_intersect(array_keys(INTERESTS), array_filter((array)($_GET['interests'] ?? []), 'is_string')));

// --- Query ---
$gifts = [];
$error = null;
try {
    if ($searched) {
        // Score = number of selected interests each gift matches.
        $score = $picked ? implode(' + ', array_fill(0, count($picked), '(FIND_IN_SET(?, interests) > 0)')) : '0';
        $params = $picked;
        $where = ['1'];
        if ($age !== null)  { $where[] = '? BETWEEN min_age AND max_age'; $params[] = $age; }
        if ($occasion)      { $where[] = "(FIND_IN_SET(?, occasions) OR occasions = 'any')"; $params[] = $occasion; }
        if ($budget)        { $where[] = 'price <= ?'; $params[] = $budget; }
        $sql = "SELECT *, $score AS score FROM gifts WHERE " . implode(' AND ', $where)
             . ($picked ? ' HAVING score > 0' : '') . ' ORDER BY score DESC, price ASC';
        $stmt = db()->prepare($sql);
        $stmt->execute($params);
        $gifts = $stmt->fetchAll();
    } else {
        $gifts = db()->query('SELECT *, 0 AS score FROM gifts ORDER BY RAND() LIMIT 8')->fetchAll();
    }
} catch (PDOException $ex) {
    error_log($ex->getMessage());
    $error = 'We couldn\'t reach the gift database. If you\'re the site owner, check the DB settings and import schema.sql.';
}

$summary = array_filter([
    $age !== null ? "age $age" : null,
    $occasion ? OCCASIONS[$occasion] : null,
    $budget ? BUDGETS[$budget] : null,
]);
?>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>What2Gift — Find the perfect gift in seconds</title>
<meta name="description" content="Personalised gift ideas by age, hobbies, interests, occasion and budget.">
<meta property="og:title" content="What2Gift — Find the perfect gift">
<meta property="og:description" content="Personalised gift ideas by age, hobbies, interests, occasion and budget.">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>🎁</text></svg>">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="style.css">
</head>
<body>

<header class="nav">
  <div class="wrap nav-inner">
    <a href="./" class="logo"><span class="logo-mark">🎁</span>What2Gift</a>
    <a href="#finder" class="btn btn-ghost">Find a gift</a>
  </div>
</header>

<section class="hero">
  <div class="wrap hero-grid">
    <div class="hero-copy">
      <span class="eyebrow">Smart gift finder</span>
      <h1>Never wonder <em>what to gift</em> again.</h1>
      <p>Tell us a little about the person — their age, what they love and the occasion — and we'll match them with thoughtful gifts from <?= count(INTERESTS) ?> interest categories.</p>
      <ul class="hero-stats">
        <li><strong>150+</strong> curated gifts</li>
        <li><strong><?= count(OCCASIONS) ?></strong> occasions</li>
        <li><strong>0–120</strong> ages covered</li>
      </ul>
    </div>

    <form id="finder" class="card finder" method="get" action="./#results">
      <h2>Who's the lucky person?</h2>

      <div class="row">
        <label class="field">
          <span>Age</span>
          <input type="number" name="age" min="0" max="120" required placeholder="e.g. 28" value="<?= e($age) ?>">
        </label>
        <label class="field">
          <span>Occasion</span>
          <select name="occasion">
            <option value="">Any occasion</option>
            <?php foreach (OCCASIONS as $k => $label): ?>
              <option value="<?= e($k) ?>" <?= $k === $occasion ? 'selected' : '' ?>><?= e($label) ?></option>
            <?php endforeach ?>
          </select>
        </label>
        <label class="field">
          <span>Budget</span>
          <select name="budget">
            <?php foreach (BUDGETS as $k => $label): ?>
              <option value="<?= $k ?>" <?= $k === $budget ? 'selected' : '' ?>><?= e($label) ?></option>
            <?php endforeach ?>
          </select>
        </label>
      </div>

      <fieldset class="field">
        <legend>Hobbies &amp; interests <small>(pick any)</small></legend>
        <div class="chips">
          <?php foreach (INTERESTS as $k => [$label, $icon]): ?>
            <label class="chip">
              <input type="checkbox" name="interests[]" value="<?= e($k) ?>" <?= in_array($k, $picked, true) ? 'checked' : '' ?>>
              <span><?= $icon ?> <?= e($label) ?></span>
            </label>
          <?php endforeach ?>
        </div>
      </fieldset>

      <button class="btn btn-primary btn-block" type="submit">Find gift ideas →</button>
    </form>
  </div>
</section>

<main id="results" class="wrap results">
  <?php if ($error): ?>
    <div class="notice notice-error"><?= e($error) ?></div>
  <?php else: ?>
    <div class="results-head">
      <?php if ($searched): ?>
        <h2><?= count($gifts) ?> gift idea<?= count($gifts) === 1 ? '' : 's' ?> found</h2>
        <p>
          <?= e(implode(' · ', $summary) ?: 'All gifts') ?>
          <?php if ($picked): ?> · sorted by best match<?php endif ?>
          · <a href="./">Start over</a>
        </p>
      <?php else: ?>
        <h2>Trending gift ideas</h2>
        <p>A random handful from our collection — use the finder above for personalised picks.</p>
      <?php endif ?>
    </div>

    <?php if (!$gifts): ?>
      <div class="notice">
        <strong>No exact matches.</strong> Try a bigger budget, a different occasion, or fewer interests.
      </div>
    <?php endif ?>

    <div class="grid">
      <?php foreach ($gifts as $g):
        $tags = explode(',', $g['interests']);
        $best = $picked && (int)$g['score'] === count($picked) && count($picked) > 1; ?>
        <article class="gift">
          <div class="gift-art"><?= e($g['emoji']) ?></div>
          <?php if ($best): ?><span class="badge">Perfect match</span><?php endif ?>
          <div class="gift-body">
            <div class="gift-top">
              <h3><?= e($g['name']) ?></h3>
              <span class="price">$<?= e(number_format((float)$g['price'])) ?></span>
            </div>
            <p><?= e($g['description']) ?></p>
            <ul class="tags">
              <?php foreach ($tags as $t): if (!isset(INTERESTS[$t])) continue; ?>
                <li class="<?= in_array($t, $picked, true) ? 'hit' : '' ?>"><?= e(INTERESTS[$t][0]) ?></li>
              <?php endforeach ?>
            </ul>
            <div class="gift-foot">
              <span class="ages">Ages <?= $g['max_age'] >= 99 ? (int)$g['min_age'] . '+' : (int)$g['min_age'] . '–' . (int)$g['max_age'] ?></span>
              <a class="shop" target="_blank" rel="noopener" href="https://www.google.com/search?tbm=shop&q=<?= urlencode($g['name']) ?>">Shop it ↗</a>
            </div>
          </div>
        </article>
      <?php endforeach ?>
    </div>
  <?php endif ?>
</main>

<footer class="footer">
  <div class="wrap">© <?= date('Y') ?> What2Gift · Built with PHP &amp; MySQL</div>
</footer>

</body>
</html>
