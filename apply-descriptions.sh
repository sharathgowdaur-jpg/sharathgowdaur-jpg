#!/usr/bin/env bash

# Apply repository descriptions for sharathgowdaur-jpg.
#
# Requires the GitHub CLI, already authenticated:
#   gh auth status
#
# Dry run first (prints what would change, writes nothing):
#   bash apply-descriptions.sh --dry-run
#
# Apply for real:
#   bash apply-descriptions.sh
#
# Safe to re-run — setting a description is idempotent.

set -uo pipefail

USER="sharathgowdaur-jpg"

DRY=0

[ "${1:-}" = "--dry-run" ] && DRY=1

set_desc() {
  local repo="$1"
  local desc="$2"

  if [ "$DRY" -eq 1 ]; then
    printf '  [dry-run] %-42s %s\n' "$repo" "$desc"
    return
  fi

  if gh repo edit "$USER/$repo" --description "$desc" >/dev/null 2>&1; then
    printf '  ✓ %-42s set\n' "$repo"
  else
    printf '  ✗ %-42s FAILED\n' "$repo"
  fi
}

echo "Applying descriptions for $USER ..."
echo

# ============================================================
# FEATURED BUILDS
# ============================================================

set_desc "SG-CUBE-Camera-Model" \
  "Voice-first multimodal AI companion combining real-time computer vision, Gemini Live, OCR, face recognition, object detection, memory, safety assistance, and accessibility features."

set_desc "smart-finance-supabase" \
  "Full-stack personal finance manager with expense and salary tracking, Supabase authentication, PostgreSQL data, row-level security, and a modern React interface."

set_desc "SmartCart-Analytics-AI" \
  "Interactive AI analytics platform for customer segmentation, exploratory analysis, visualization, and business insights using K-Means and Agglomerative Clustering."

set_desc "Text-Summarizer-Web-Application" \
  "AI-powered NLP web application that transforms long text, conversations, and articles into concise summaries while preserving core context and meaning."

set_desc "CliffWalking_-SARSA-Q_Learning-game" \
  "Interactive reinforcement-learning game exploring SARSA and Q-Learning strategies through a retro-style CliffWalking environment."

set_desc "DSA_leetcode-journey" \
  "Daily Python solutions focused on data structures, algorithms, problem-solving patterns, and coding interview preparation through LeetCode."

echo

echo "Done."
echo "Verify repositories at:"
echo "https://github.com/sharathgowdaur-jpg?tab=repositories"