#!/bin/bash

# Claude ACP Demo Script
# Claude Codeとの統合を示すデモスクリプト

set -e

echo "🚀 CCSwarm Claude ACP Demo"
echo "=========================="
echo ""

# カラー設定
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ccswarmが利用可能か確認
if ! command -v ccswarm &> /dev/null; then
    echo -e "${RED}❌ Error: ccswarm is not installed${NC}"
    echo "Please install ccswarm first:"
    echo "  cargo install --path ../crates/ccswarm"
    exit 1
fi

echo -e "${YELLOW}📋 Step 1: Claude Code接続テスト${NC}"
echo "Testing connection to Claude Code..."
if ccswarm claude-acp test; then
    echo -e "${GREEN}✅ Connection test successful!${NC}"
else
    echo -e "${RED}❌ Connection failed. Is Claude Code running?${NC}"
    echo "Please start Claude Code and try again."
    exit 1
fi

echo ""
echo -e "${YELLOW}📋 Step 2: ステータス確認${NC}"
ccswarm claude-acp status

echo ""
echo -e "${YELLOW}📋 Step 3: タスク送信デモ${NC}"
echo "Sending various tasks to Claude Code..."

# タスク1: コードレビュー
echo ""
echo "Task 1: Code Review"
ccswarm claude-acp send "Review the ccswarm codebase and identify top 3 areas for improvement"

sleep 2

# タスク2: ドキュメント生成
echo ""
echo "Task 2: Documentation Generation"
ccswarm claude-acp send "Generate API documentation for the SimplifiedClaudeAdapter"

sleep 2

# タスク3: テスト作成
echo ""
echo "Task 3: Test Creation"
ccswarm claude-acp send "Create unit tests for the ACP connection module"

echo ""
echo -e "${YELLOW}📋 Step 4: 診断情報${NC}"
ccswarm claude-acp diagnose

echo ""
echo -e "${GREEN}✅ Demo completed successfully!${NC}"
echo ""
echo "Summary:"
echo "- Successfully connected to Claude Code via ACP"
echo "- Sent multiple tasks for processing"
echo "- Verified connection stability"
echo ""
echo "You can now use ccswarm with Claude Code for your development tasks!"