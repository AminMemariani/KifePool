import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/core/models/blockchain_models.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/features/nfts/presentation/widgets/nft_card_widget.dart';
import 'package:kifepool/features/nfts/presentation/widgets/nft_transfer_dialog.dart';

/// NFT gallery screen
class NftGalleryScreen extends StatefulWidget {
  const NftGalleryScreen({super.key});

  @override
  State<NftGalleryScreen> createState() => _NftGalleryScreenState();
}

class _NftGalleryScreenState extends State<NftGalleryScreen>
    with TickerProviderStateMixin {
  List<NFT> _nfts = [];
  bool _isLoading = false;
  String? _error;
  String _selectedChain = 'polkadot';
  String _searchQuery = '';
  String _sortBy = 'name';
  bool _showGrid = true;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _loadNfts();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadNfts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final walletProvider = Provider.of<WalletProvider>(
        context,
        listen: false,
      );
      final activeAccount = walletProvider.activeAccount;

      if (activeAccount != null) {
        // Mock NFT data - in production, this would come from the blockchain service
        final mockNfts = _generateMockNfts(activeAccount.address);
        setState(() {
          _nfts = mockNfts;
        });
        _animationController.forward();
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<NFT> _generateMockNfts(String address) {
    return List.generate(20, (index) {
      return NFT(
        id: 'nft_${index + 1}',
        name: 'NFT #${index + 1}',
        description: 'This is a unique NFT with special properties',
        imageUrl: 'https://picsum.photos/300/300?random=$index',
        collection: 'Collection ${(index % 5) + 1}',
        owner: address,
        chain: _selectedChain,
        metadata: {
          'rarity': ['common', 'rare', 'epic', 'legendary'][index % 4],
          'attributes': [
            {
              'trait_type': 'Color',
              'value': ['Red', 'Blue', 'Green', 'Purple'][index % 4],
            },
            {
              'trait_type': 'Type',
              'value': ['Art', 'Music', 'Game', 'Utility'][index % 4],
            },
          ],
        },
      );
    });
  }

  List<NFT> get _filteredNfts {
    var filtered = _nfts.where((nft) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          nft.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          nft.collection.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesChain = nft.chain == _selectedChain;

      return matchesSearch && matchesChain;
    }).toList();

    // Sort NFTs
    switch (_sortBy) {
      case 'name':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'collection':
        filtered.sort((a, b) => a.collection.compareTo(b.collection));
        break;
      case 'recent':
        filtered.sort((a, b) => b.id.compareTo(a.id));
        break;
    }

    return filtered;
  }

  Future<void> _transferNft(NFT nft) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => NftTransferDialog(nft: nft),
    );

    if (result == true) {
      _loadNfts(); // Refresh the list
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My NFTs'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _showGrid = !_showGrid;
              });
            },
            icon: Icon(_showGrid ? Icons.list : Icons.grid_view),
          ),
          IconButton(onPressed: _loadNfts, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Column(
        children: [
          // Search and filter bar
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                // Search bar
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search NFTs...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.md),

                // Filter row
                Row(
                  children: [
                    // Chain selector
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedChain,
                        decoration: const InputDecoration(
                          labelText: 'Chain',
                          border: OutlineInputBorder(),
                        ),
                        items: ['polkadot', 'kusama', 'moonbeam', 'astar']
                            .map(
                              (chain) => DropdownMenuItem(
                                value: chain,
                                child: Text(chain.capitalize()),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedChain = value!;
                          });
                          _loadNfts();
                        },
                      ),
                    ),

                    const SizedBox(width: AppSpacing.md),

                    // Sort selector
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _sortBy,
                        decoration: const InputDecoration(
                          labelText: 'Sort by',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          DropdownMenuItem(value: 'name', child: Text('Name')),
                          DropdownMenuItem(
                            value: 'collection',
                            child: Text('Collection'),
                          ),
                          DropdownMenuItem(
                            value: 'recent',
                            child: Text('Recent'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _sortBy = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NFT list
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Failed to load NFTs',
                          style: AppTypography.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          _error!,
                          style: AppTypography.bodyMedium.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        ElevatedButton(
                          onPressed: _loadNfts,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : _filteredNfts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image_not_supported_outlined,
                          size: 64,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.5),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'No NFTs found',
                          style: AppTypography.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'You don\'t have any NFTs on this chain yet',
                          style: AppTypography.bodyMedium.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  )
                : FadeTransition(
                    opacity: _fadeAnimation,
                    child: _showGrid ? _buildGridView() : _buildListView(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
      ),
      itemCount: _filteredNfts.length,
      itemBuilder: (context, index) {
        final nft = _filteredNfts[index];
        return NftCardWidget(
          nft: nft,
          onTap: () => _transferNft(nft),
          showTransferButton: true,
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: _filteredNfts.length,
      itemBuilder: (context, index) {
        final nft = _filteredNfts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: AppSpacing.md),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: Image.network(
                nft.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: Icon(
                      Icons.image_not_supported,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
            ),
            title: Text(nft.name),
            subtitle: Text(nft.collection),
            trailing: IconButton(
              onPressed: () => _transferNft(nft),
              icon: const Icon(Icons.send),
              tooltip: 'Transfer NFT',
            ),
            onTap: () => _transferNft(nft),
          ),
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
