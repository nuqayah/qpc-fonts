from pathlib import Path
import regex as re
import sys

def apply_repls(text, repls):
    for r in repls:
        text = re.sub(r[1], r[2], text) if r[0] else text.replace(r[1], r[2])
    return text


######################################################
## Main
######################################################
repls = {
    'qaloon': [
        (1, r'(?m)^(\[\])?سُورَةُ .*\n\n', ''),
        (0, '[]', ''),  # leftover from surah names
        (0, '۞\xa0', '۞ '),
        (1, r'(بّ?ِسْمِ اِ۬للَّهِ اِ۬لرَّحْمَٰنِ اِ۬لرَّحِيمِۖ?)\n\n', r'\1 '),  # merge basmalah with first ayah
        (1, r'(?<=\S)\n(?=\S)', ' '),  # unwraps ayahs
        (1, r'\xa0(\d+)\s', r' \1\n'),  # add \n after ayah end
        (1, r'\n\n+', '\n'),  # 114x
        (0, '۩', ' ۩'),  # 12x
    ],
}

if len(sys.argv) < 3:
    print('Usage: python prep_qpc_mushaf.py <mushaf> <file>')
    print('To convert docx to txt: pandoc --wrap=none -t plain -o <mushaf_label>.txt <docx>')
    print('Mushafs:')
    for r in repls:
        print(f'  {r}')
    sys.exit(1)

file = Path(sys.argv[2])
text = apply_repls(file.read_text(), repls[sys.argv[1]])
file.with_name(file.stem + '-lines.txt').write_text(text)
