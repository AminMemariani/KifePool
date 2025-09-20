/// RPC node configuration for different networks
class RpcConfig {
  static const Map<String, List<RpcNode>> _rpcNodes = {
    'polkadot': [
      RpcNode(
        name: 'Polkadot Official',
        url: 'wss://rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://polkadot.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Parity',
        url: 'wss://polkadot-rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Dwellir',
        url: 'wss://polkadot-rpc.dwellir.com',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'RadiumBlock',
        url: 'wss://polkadot.public.curie.radiumblock.co/ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'kusama': [
      RpcNode(
        name: 'Kusama Official',
        url: 'wss://kusama-rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://kusama.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Parity',
        url: 'wss://kusama-rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Dwellir',
        url: 'wss://kusama-rpc.dwellir.com',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'RadiumBlock',
        url: 'wss://kusama.public.curie.radiumblock.co/ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'moonbeam': [
      RpcNode(
        name: 'Moonbeam Official',
        url: 'wss://wss.api.moonbeam.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://moonbeam.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Blast API',
        url: 'wss://moonbeam.public.blastapi.io',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'astar': [
      RpcNode(
        name: 'Astar Official',
        url: 'wss://rpc.astar.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://astar.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Blast API',
        url: 'wss://astar.public.blastapi.io',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'acala': [
      RpcNode(
        name: 'Acala Official',
        url: 'wss://acala-rpc-0.aca-api.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://acala.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Acala Foundation',
        url: 'wss://acala-rpc-1.aca-api.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
    ],
    'karura': [
      RpcNode(
        name: 'Karura Official',
        url: 'wss://karura-rpc-0.aca-api.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://karura.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Acala Foundation',
        url: 'wss://karura-rpc-1.aca-api.network',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
    ],
    'shiden': [
      RpcNode(
        name: 'Shiden Official',
        url: 'wss://shiden-rpc.dwellir.com',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://shiden.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'Blast API',
        url: 'wss://shiden.public.blastapi.io',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'khala': [
      RpcNode(
        name: 'Khala Official',
        url: 'wss://khala-rpc.dwellir.com',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://khala.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'bifrost': [
      RpcNode(
        name: 'Bifrost Official',
        url: 'wss://bifrost-rpc.liebi.com/ws',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://bifrost.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'statemint': [
      RpcNode(
        name: 'Statemint Official',
        url: 'wss://statemint-rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://statemint.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
    'statemine': [
      RpcNode(
        name: 'Statemine Official',
        url: 'wss://statemine-rpc.polkadot.io',
        isOfficial: true,
        region: 'Global',
        latency: 0,
      ),
      RpcNode(
        name: 'OnFinality',
        url: 'wss://statemine.api.onfinality.io/public-ws',
        isOfficial: false,
        region: 'Global',
        latency: 0,
      ),
    ],
  };

  /// Get all available RPC nodes for a specific network
  static List<RpcNode> getRpcNodes(String network) {
    return _rpcNodes[network.toLowerCase()] ?? [];
  }

  /// Get all supported networks
  static List<String> getSupportedNetworks() {
    return _rpcNodes.keys.toList();
  }

  /// Get the default RPC node for a network (first official node, or first node if no official)
  static RpcNode? getDefaultRpcNode(String network) {
    final nodes = getRpcNodes(network);
    if (nodes.isEmpty) return null;

    // Try to find an official node first
    final officialNode = nodes.firstWhere(
      (node) => node.isOfficial,
      orElse: () => nodes.first,
    );

    return officialNode;
  }

  /// Get RPC node by URL
  static RpcNode? getRpcNodeByUrl(String network, String url) {
    final nodes = getRpcNodes(network);
    try {
      return nodes.firstWhere((node) => node.url == url);
    } catch (e) {
      return null;
    }
  }

  /// Check if a network is supported
  static bool isNetworkSupported(String network) {
    return _rpcNodes.containsKey(network.toLowerCase());
  }
}

/// RPC node model
class RpcNode {
  final String name;
  final String url;
  final bool isOfficial;
  final String region;
  final int latency; // in milliseconds
  final bool isHealthy;
  final DateTime? lastChecked;

  const RpcNode({
    required this.name,
    required this.url,
    required this.isOfficial,
    required this.region,
    this.latency = 0,
    this.isHealthy = true,
    this.lastChecked,
  });

  /// Create a copy with updated properties
  RpcNode copyWith({
    String? name,
    String? url,
    bool? isOfficial,
    String? region,
    int? latency,
    bool? isHealthy,
    DateTime? lastChecked,
  }) {
    return RpcNode(
      name: name ?? this.name,
      url: url ?? this.url,
      isOfficial: isOfficial ?? this.isOfficial,
      region: region ?? this.region,
      latency: latency ?? this.latency,
      isHealthy: isHealthy ?? this.isHealthy,
      lastChecked: lastChecked ?? this.lastChecked,
    );
  }

  @override
  String toString() {
    return 'RpcNode(name: $name, url: $url, isOfficial: $isOfficial, region: $region, latency: ${latency}ms, isHealthy: $isHealthy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RpcNode && other.url == url;
  }

  @override
  int get hashCode => url.hashCode;
}
