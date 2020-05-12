class PathFinder {
  final String enterSymbol;
  final String exitSymbol;
  final String wallSymbol;
  List<List<String>> mapGrid;
  int maxX;
  int maxY;

  PathFinder(
    int width,
    int height,
    List<String> mapLines,
    this.enterSymbol,
    this.exitSymbol,
    this.wallSymbol,
  ) {
    maxX = width - 1;
    maxY = height - 1;
    mapGrid = mapLines.map((e) => e.split('')).toList();
  }

  /// Start to find path from enter to exit
  bool startFind() {
    final start = _findOptimizedStartPoint() ?? _findBruteForceStartPoint();

    if (start == null) {
      throw 'Cannot find enter point label by $enterSymbol';
    }
    print('Start at x:${start[0]}, y:${start[1]}');
    return _findPath(start[0], start[1]);
  }

  /// Find path from specific point
  bool _findPath(int x, int y) {
    if (_isOutside(x, y)) return false;
    if (_isExit(x, y)) return true;
    if (!_isOpen(x, y)) return false;

    _markPath(x, y);

    if (_isExitAround(x, y)) return true;

    // Go to bottom
    if (_findPath(x, y + 1) == true) return true;
    // Go to right
    if (_findPath(x + 1, y) == true) return true;
    // Go to left
    if (_findPath(x - 1, y) == true) return true;
    // Go to top
    if (_findPath(x, y - 1) == true) return true;

    _unmarkPath(x, y);
    return false;
  }

  /// Check that point provide is not outside of maze
  bool _isOutside(int x, int y) {
    if (x > maxX || y > maxY) return true;
    if (x < 0 || y < 0) return true;
    return false;
  }

  /// Check if the point is the exit
  bool _isExit(int x, int y) {
    try {
      return _grid(x, y) == exitSymbol;
    } catch (_) {
      return false;
    }
  }

  /// Check if there is a point around that is the exit
  bool _isExitAround(int x, int y) =>
      _isExit(x + 1, y) ||
      _isExit(x - 1, y) ||
      _isExit(x, y + 1) ||
      _isExit(x, y - 1);

  /// Check if the point is the enter
  bool _isEnter(int x, int y) => _grid(x, y) == enterSymbol;

  /// Check if for a specific point it's ok, no obstacle
  bool _isOpen(int x, int y) {
    if (_grid(x, y) == ' ') return true;
    if (_isEnter(x, y)) return true;
    return false;
  }

  /// Get value at specific point
  String _grid(int x, int y) => mapGrid[y][x];

  /// Add a symbol to specify correct path at a specific point
  void _markPath(int x, int y) => _markPathSymbol(x, y, '.');

  /// Add a symbol to specify wrong path at a specific point
  void _unmarkPath(int x, int y) => _markPathSymbol(x, y, '/');

  /// Add a symbol at a specific point
  void _markPathSymbol(int x, int y, String symbol) {
    if (!_isEnter(x, y)) {
      mapGrid[y][x] = symbol;
    }
  }

  /// Find starting point only on sides
  List<int> _findOptimizedStartPoint() {
    for (var y = 0; y <= maxY; y++) {
      if (y == 0 || y == maxY) {
        final index = mapGrid[y].indexOf(enterSymbol);
        if (index >= 0) return [index, y];
      } else if (_isEnter(0, y)) {
        return [0, y];
      } else if (_isEnter(maxX, y)) {
        return [maxX, y];
      }
    }
    return null;
  }

  /// Find starting point in whole surface
  List<int> _findBruteForceStartPoint() {
    for (var y = 0; y <= maxY; y++) {
      final index = mapGrid[y].indexOf(enterSymbol);
      if (index >= 0) return [index, y];
    }
    return null;
  }

  @override
  String toString() => mapGrid.map((e) => e.join('')).join('\n');
}
