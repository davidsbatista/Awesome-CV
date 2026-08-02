.PHONY: cv clean

CV_DIR = dsbatista
SRCS = $(wildcard $(CV_DIR)/*.tex) awesome-cv.cls

cv: $(CV_DIR)/cv.pdf

# cv.tex uses bare \input{summary.tex}, so $(CV_DIR) must be on TEXINPUTS.
# The class resolves from the repo root, which is the working directory here.
$(CV_DIR)/cv.pdf: $(SRCS)
	TEXINPUTS="$(CV_DIR):$$TEXINPUTS" xelatex -output-directory=$(CV_DIR) $(CV_DIR)/cv.tex

clean:
	rm -f $(CV_DIR)/cv.pdf $(CV_DIR)/*.aux $(CV_DIR)/*.log
