#!/bin/bash

# Task Management Demo Script
# ccswarmのタスク管理機能を示すデモ

set -e

echo "🎯 CCSwarm Task Management Demo"
echo "================================"
echo ""

# カラー設定
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# プロジェクトの初期化
echo -e "${YELLOW}📋 Step 1: プロジェクトの初期化${NC}"
echo "Initializing a new project..."

PROJECT_NAME="demo-project-$(date +%s)"
ccswarm init --name "$PROJECT_NAME" --agents frontend,backend,qa

echo -e "${GREEN}✅ Project initialized: $PROJECT_NAME${NC}"

echo ""
echo -e "${YELLOW}📋 Step 2: タスクの作成${NC}"
echo "Creating various tasks..."

# フロントエンドタスク
ccswarm task add \
  "Create React login component" \
  --priority high \
  --task-type development

# バックエンドタスク
ccswarm task add \
  "Implement user authentication API" \
  --priority critical \
  --task-type development

# QAタスク
ccswarm task add \
  "Write E2E tests for login flow" \
  --priority medium \
  --task-type testing

echo -e "${GREEN}✅ Tasks created successfully${NC}"

echo ""
echo -e "${YELLOW}📋 Step 3: タスクリストの確認${NC}"
ccswarm task list --all

echo ""
echo -e "${YELLOW}📋 Step 4: タスクの実行状況確認${NC}"
ccswarm status --detailed

echo ""
echo -e "${YELLOW}📋 Step 5: エージェント状態の確認${NC}"
ccswarm agents --all

echo ""
echo -e "${BLUE}💡 Demo Tips:${NC}"
echo "- Use 'ccswarm task status <id>' to check task status"
echo "- Use 'ccswarm task cancel <id>' to cancel a task"
echo "- Use 'ccswarm task history' to view task execution history"
echo ""
echo -e "${GREEN}✅ Task management demo completed!${NC}"