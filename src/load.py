import csv
from pathlib import Path


def load_sales(path: Path) -> list[dict]:
    """売上の CSV を読み込んで、1行ずつ辞書にして返す"""
    with path.open(encoding="utf-8") as f:
        return list(csv.DictReader(f))