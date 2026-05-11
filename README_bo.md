# ཀྲུང་དབྱང་མི་རིགས་སློབ་གྲྭ་ཆེན་མོའི་དངོས་གཞི་སློབ་མའི་མཐར་ཕྱིན་དཔྱད་རྩོམ $\LaTeX$ དཔེ་པང་། 
 
[简体中文](README.md) | [བོད་ཡིག](README_bo.md)

ཀྲུང་དབྱང་མི་རིགས་སློབ་གྲྭ་ཆེན་མོའི་སྒྲིག་སྲོལ་དང་མཐུན་པ། ཆེད་ལས་དང་བེད་སྤྱོད་བདེ་བའི་ LaTeX དངོས་གཞི་སློབ་མའི་མཐར་ཕྱིན་དཔྱད་རྩོམ་གྱི་དཔེ་པང་ཞིག

---

## བེད་སྤྱོད་གཏོང་སྟངས། (How to use)

### དྲ་ཐོག་ཏུ་སྒྲིག་བཟོ་བྱེད་པ། (Overleaf)
1. [Releases](https://github.com/KardeniaPoyu/muc-thesis/releases) ནས་ `Source code (zip)` ཕབ་ལེན་བྱེད་དགོས།
2. Overleaf ནང་དུ་ `Upload Project` བརྒྱུད་ནས་ཡར་སྤྲོད་དགོས།
3. `Compiler` འདི་ **XeLaTeX** ལ་བསྒྱུར་དགོས།

### ས་གནས་སུ་སྒྲིག་བཟོ་བྱེད་པ། (Local)
ཁྱེད་ཀྱི་གློག་ཀླད་དུ་ [TeX Live](https://www.tug.org/texlive/) (>= 2020) ཡོད་དགོས།

**སྒྲིག་བཟོ་བྱེད་པའི་བཀའ་བརྡ།:**
```bash
xelatex main
biber main
xelatex main
xelatex main
```

---

## ཡིག་ཆའི་བཀོད་པ། (Project Structure)

```text
muc-thesis/
├── main.tex                        # དཔྱད་རྩོམ་གྱི་འཇུག་སྒོ། (Main entry)
├── muc-thesis.cls                  # དཔེ་པང་གི་སྒྲིག་གཞི། (Class file)
├── contents/                       # [核心] དཔྱད་རྩོམ་གྱི་ནང་དོན་དངོས། (Contents)
│   ├── abstract.tex                # ནང་དོན་གནད་བསྡུས། (Abstract)
│   ├── 01-introduction.tex         # ལེའུ་དང་པོ།
│   └── acknowledgements.tex        # ཐུགས་རྗེ་ཆེ་ཞུ། (Acknowledgements)
├── references.bib                  # ལུང་འདྲེན་དཔྱད་ཡིག (Bibliography)
├── figures/                        # པར་རིས་ཡིག་སྣོད། (Figures)
```

---

## མགྱོགས་མྱུར་འཇུག་པ། (Quick Start)

1. **མི་སྒེར་གྱི་གནས་ཚུལ་བཟོ་བཅོས།**：`main.tex` ཁ་ཕྱེ་ནས། `\title` དང་ `\author` སོགས་བཟོ་བཅོས་རྒྱོབ།
2. **གློག་རྡུལ་མིང་རྟགས།**：
   * `\sigstudent[3cm]{...}` （སློབ་མའི་མིང་རྟགས།）
   * `\sigsupervisor[2.5cm]{...}` （དགེ་རྒན་གྱི་མིང་རྟགས།）
3. **དཔྱད་རྩོམ་འབྲི་བ།**：`contents/` ནང་གི་ཡིག་ཆ་རྣམས་སུ་ནང་དོན་བྲིས་ཆོག

---

## གྲོས་མཐུན། (License)

MIT License
