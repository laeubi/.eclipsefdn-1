local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse.equinox', 'eclipse-equinox') {
  settings+: {
    description: "",
    name: "Eclipse Equinox",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/equinox/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
    orgs.newOrgWebhook('https://ci.eclipse.org/releng/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_squash_merge: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('equinox') {
      default_branch: "master",
      allow_squash_merge: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      description: "equinox",
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('GIST_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('EQUINOX_BOT_PAT') {
          value: "pass:bots/eclipse.equinox/github.com/token-hd5020",
        },
      ],
    },
    orgs.newRepo('equinox-website') {
      allow_update_branch: false,
      default_branch: "master",
      allow_squash_merge: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
    orgs.newRepo('equinox.binaries') {
      default_branch: "master",
      allow_squash_merge: false,
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('equinox.bundles') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('equinox.framework') {
      default_branch: "master",
      delete_branch_on_merge: false,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          bypass_pull_request_allowances+: [
            "@eclipse-releng-bot"
          ],
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('p2') {
      default_branch: "master",
      allow_squash_merge: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('R*maintenance') {
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      secrets: [
        orgs.newRepoSecret('EQUINOX_BOT_PAT') {
          value: "pass:bots/eclipse.equinox/github.com/token-hd5020",
        },
      ],
    },
  ],
}
